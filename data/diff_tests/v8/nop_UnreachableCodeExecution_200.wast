;; 1. Test a simple sequence where `nop` is followed by `unreachable`. Ensure there's code following `unreachable` that should never execute. This will check if the sequence handling skips `nop` correctly:    - `nop`    - `unreachable`    - `i32.const 42`    - `i32.add`

(assert_invalid
  (module (func
    (nop)
    (unreachable)
    (i32.const 42)
    (i32.add)))
  "type mismatch")