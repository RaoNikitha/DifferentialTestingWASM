;; 5. Test a `block` that initiates a tail-call to an imported function which contains another `block` that uses `br_table`. Check for correct indexing and continuity of the stack across module calls.

(assert_invalid
  (module
    (import "env" "func" (func $imported (param i32) (result i32)))
    (func (export "test") (param i32) (result i32)
      (block (result i32)
        (call $imported (i32.const 0))
        (block (result i32)
          (i32.const 1)
          (br_table 0 (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)