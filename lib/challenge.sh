#!/usr/bin/env bash

resolve_challenge() {
  local rel="${1#./}"
  local qdir="$ROOT_DIR/$rel"

  [[ "$rel" != /* ]] || die "Challenge path must be repository-relative."
  [[ -d "$qdir" ]] || die "Challenge not found: $rel"

  local required=(metadata.yaml question.md setup.sh verify.sh reset.sh solution.md)
  local f
  for f in "${required[@]}"; do
    [[ -f "$qdir/$f" ]] || die "Invalid challenge: missing $f"
  done

  printf '%s\n' "$qdir"
}

meta_get() {
  local file="$1"
  local key="$2"

  awk -v k="$key" '
    $0 ~ "^[[:space:]]*" k ":[[:space:]]*" {
      line=$0
      sub("^[[:space:]]*" k ":[[:space:]]*", "", line)
      gsub(/^["'\'' ]+|["'\'' ]+$/, "", line)
      print line
      exit
    }
  ' "$file"
}

print_challenge_header() {
  local qdir="$1"
  local m="$qdir/metadata.yaml"
  local cert domain topic difficulty target

  cert="$(meta_get "$m" certification)"
  domain="$(meta_get "$m" domain)"
  topic="$(meta_get "$m" topic)"
  difficulty="$(meta_get "$m" difficulty)"
  target="$(meta_get "$m" time_target)"

  printf '%s\n' '=================================================='
  printf '%s - %s\n' "$cert" "$domain"
  printf 'Topic: %s\n' "$topic"
  printf 'Difficulty: %s\n' "$difficulty"
  printf 'Target time: %s\n' "$target"
  printf '%s\n\n' '=================================================='
}

run_challenge_script() {
  local qdir="$1"
  local script="$2"
  local mode="${3:-normal}"

  [[ -x "$qdir/$script" ]] || die "$script is not executable: $qdir/$script"

  if [[ "$mode" == "quiet" ]]; then
    (cd "$qdir" && "./$script" >/dev/null)
  else
    (cd "$qdir" && "./$script")
  fi
}

list_challenges() {
  local cert="${1:-}"
  local search_root="$ROOT_DIR"

  if [[ -n "$cert" ]]; then
    case "$cert" in
      cka|ckad|cks) search_root="$ROOT_DIR/$cert" ;;
      *) die "Certification must be one of: cka, ckad, cks" ;;
    esac
  fi

  local found=0
  while IFS= read -r metadata; do
    found=1
    local qdir rel c d t diff target
    qdir="$(dirname "$metadata")"
    rel="${qdir#"$ROOT_DIR/"}"
    c="$(meta_get "$metadata" certification)"
    d="$(meta_get "$metadata" domain)"
    t="$(meta_get "$metadata" topic)"
    diff="$(meta_get "$metadata" difficulty)"
    target="$(meta_get "$metadata" time_target)"
    printf '%-78s  %-6s  %-5s  %s / %s\n' "$rel" "$diff" "$target" "$c" "$t"
  done < <(find "$search_root" -type f -name metadata.yaml | sort)

  [[ $found -eq 1 ]] || info "No challenges found."
}
