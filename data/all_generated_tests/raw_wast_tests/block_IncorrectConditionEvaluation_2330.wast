;; 1. Create a block that conditionally branches using `br_if` based on a comparison operation. Ensure the condition for branching is clearly false. Check if the block exits prematurely as if `br_if` always evaluates true. This test checks if conditional evaluation is faulty.

(assert_invalid
  (module
    (func $conditional-branch
      (block $label (result i32)
        (i32.const 1)
        (i32.const 0)
        (i32.eq) 
        (br_if $label (i32.const 42))
      )
      (drop)
    )
  )
  "type mismatch"
)