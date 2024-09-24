;; Test a `loop` block where `br_table` is used in combination with conditional branches (`br_if`) leading to different control flows and verify both implementations handle these combinations correctly.

(assert_invalid
  (module
    (func $loop_br_table_conditional (param i32) (result i32)
      (loop (result i32)
        (get_local 0)
        (br_if 1 (i32.const 0))
        (block (br_table 0 1 (br_if 0 (i32.const 1))))
        (i32.const 42)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)