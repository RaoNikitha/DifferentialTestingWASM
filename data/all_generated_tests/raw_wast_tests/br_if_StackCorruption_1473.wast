;; Test 4: Create a sequence of `br_if` instructions with conditions that alternate between true and false. Test the stack’s integrity by validating the number of operands left on the stack after each branch.

(assert_invalid
  (module 
    (func $alternate_br_if (result i32)
      (block (result i32)
        (i32.const 42)
        (block (result i32) (i32.const 1) (br_if 0 (i32.const 1)) (i32.const 0) (br_if 0 (i32.const 1)) )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)