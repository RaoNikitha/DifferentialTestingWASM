;; Test 9: Use a block with a `br_if` that checks a local variable modified inside a different block nested within the main block. Ensure the branching reflects the updated variable’s value accurately.

(assert_invalid
 (module
  (func $nested-blocks-with-br-if (result i32)
   (local i32)
   (block (result i32)
    (block
     (local.set 0 (i32.const 1))
    )
    (br_if 0 (local.get 0))
    (i32.const 2)
   )
  )
 )
 "type mismatch"
)