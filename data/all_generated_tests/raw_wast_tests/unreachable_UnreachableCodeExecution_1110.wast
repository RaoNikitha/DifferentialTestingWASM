;; 1. Create a WebAssembly function that performs a division operation but br an instruction jumps to an `unreachable` instruction if the divisor is zero.

(assert_invalid
  (module (func $division-by-zero-unreachable (param i32) (result i32)
    (block (br_if 0 (i32.eqz (local.get 0))) (unreachable)) (nop)
  ))
  "type mismatch"
)