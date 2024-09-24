;; Test 5: Design a block specifying a void result (no result) but perform operations inside that leave an i32 on the stack. Exit the block and check if the i32 is correctly ignored or causes a validation error.

(assert_invalid
  (module (func $type-void-with-i32 
    (block (result) (i32.const 42))
  ))
  "type mismatch"
)