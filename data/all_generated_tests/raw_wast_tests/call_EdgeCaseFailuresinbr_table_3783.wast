;; 2. Define a function with mixed parameter types (int, float) and use it in a `call` instruction followed by a `br_table` with minimal valid targets. Ensure that index resolution in `br_table` interacts correctly with stack state. Check if Wizard_engine's `checkAndPopArgs` and `pushTypes` correctly reflect the mixed types when popping/pushing.

(assert_invalid
  (module
    (func $mixed-types-func (param i32 f32 i32) (param f64) (result i32 i32)
      (i32.const 0) (i32.const 1)
    )
    (func $test-func
      (call $mixed-types-func (i32.const 1) (f32.const 1.0) (i32.const 2) (f64.const 2.0))
      (br_table 0 0 (i32.const 0))
    )
  )
  "type mismatch"
)