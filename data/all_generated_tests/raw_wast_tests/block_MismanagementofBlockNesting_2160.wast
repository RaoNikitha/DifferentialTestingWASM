;; 1. **Test 1**:    Create three nested `block` instructions with an inner block containing a `br 2` branch. Check if each implementation correctly branches to the outermost block and resumes after its `end`. This test checks if nested block depth is managed correctly.

(assert_invalid
  (module (func
    (block
      (block
        (block
          (br 2)
        )
      )
    )
  ))
  "invalid branch depth"
)