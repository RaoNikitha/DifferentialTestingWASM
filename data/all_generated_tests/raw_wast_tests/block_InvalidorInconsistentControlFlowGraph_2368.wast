;; 9. **Backward Label Indexing**:    - **Test Description**: Implement jumps that incorrectly reference labels in a backward manner, creating invalid executions paths within a block.    - **Reasoning**: This test checks for enforcement against backward referencing in label indexing and structured jumps.    - **Constraint checked**: Label Indexing Rule    - **Relation to CFG**: Ensures CFG accurately models only forward branching paths and avoids erroneous loopbacks.

(assert_invalid
  (module (func $backward-label-indexing 
    (block (result i32)
      (block (result i32) 
        (br 1 (i32.const 10)) 
        (block (result i32)
          (br 3 (i32.const 20)) 
        )
      )
    )
  ))
  "jump to non-existent label index"
)