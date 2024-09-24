;; Test 1: Create a nested block structure with a `block` inside another `block`, and use `br` to target the inner `block` from within the innermost block. This tests the correct identification and branching to a simple inner block.

(assert_invalid
  (module 
    (func $nested-blocks 
      (block 
        (block 
          (block 
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)