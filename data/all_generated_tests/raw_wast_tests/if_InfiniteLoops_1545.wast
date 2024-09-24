;; 6. **Test Description**: An `if-else` block within a `loop`, where the `else` part includes back-references to stack conditions or labels, ensuring these correctly propagate out of nested structures.    **Constraint Checked**: Verifies label handling and stack consistency in back-referenced branches within nested structures.    **Relation to Infinite Loops**: Incorrect label control or back-referencing may cause repeated fail conditions, failing to break the loop.

(assert_invalid
  (module
    (func $test-back-reference-loop (result i32)
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (then 
            (if (result i32) (i32.const 2) (else (i32.const 3)))
          )
          (else 
            (br 1 (i32.const 4)) 
          )
        )
      ) 
    )
  )
  "type mismatch"
)