;; 10. **Complex Control Flow with Nested Br Calls:**     Create a test with deeply nested calls to imported functions, where each level contains multiple `br` instructions to different labels. This would rigorously test the relative label indexing and operand stack consistency across complex module boundaries.

(assert_invalid
  (module
    (func (import "" "importedFunc1"))
    (func (import "" "importedFunc2"))
    (func 
      (block
        (block
          (block
            (br 2) 
            (call 0) 
            (block
              (br 2)
              (call 1)
              (block 
                (br 1)
                (call 1)
                (br 3)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)