;; Create a test with a deeply nested structure consisting of several `block` and `loop` instructions and add a `br` instruction targeting the outermost `block` (`label N-1`). Ensure the branch target resolves to the correct outermost block and the control flow resumes correctly after its `end` instruction.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (block
            (block 
              (block 
                (block 
                  (block
                    (block
                      (br 6))))))))))
  "unknown label"
)