;; 9. Include `nop` in a sequence of logical operations culminating in `unreachable`:    - `i32.const 0`    - `i32.eqz`    - `nop`    - `unreachable`    - `i32.const 9`

(assert_invalid
  (module
    (func (result i32)
      i32.const 0
      i32.eqz
      nop
      unreachable
      i32.const 9))
  "type mismatch"
)