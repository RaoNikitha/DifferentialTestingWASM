;; 6. Design a `br_table` where one block index is correctly typed, while others exceed the nesting depth, testing if both engines correctly respect the out-of-bound label references and handle stack type requirements.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32) (br_table 2 0 (i32.const 1))) (i32.const 0)
    )
  ))
  "unknown label"
)