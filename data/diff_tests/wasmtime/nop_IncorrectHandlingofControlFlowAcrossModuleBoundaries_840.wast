;; 1. **Test Description**: Create a function in module A that consists solely of a `nop` instruction followed by a call to a function in module B. Ensure module B's function performs a simple stack operation (e.g., push a constant). This test checks if the `nop` instruction correctly preserves the stack when transitioning between modules.

(assert_invalid
  (module
    (import "moduleB" "func" (func $b_func (result i32)))
    (func $test (result i32)
      nop
      call $b_func
    )
  )
  "type mismatch"
)