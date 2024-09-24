;; 1. **Nested Loop with Multiple Branching Levels**:    - Test Description: Create a WebAssembly module with nested loop blocks where an inner loop uses `br` to jump to an outer loop.    - Constraint: Ensure labels within nested loops are appropriately managed, checking the correct resolution of label depth.    - Relation: This test challenges the correct interpretation of nested loop depths and label management, highlighting any mismanagement in branch targets.

(assert_invalid
  (module
    (func $nested_loop_with_branching
      (loop $outer (loop $inner (br $outer)) (drop))  
    )
  )
  "type mismatch"
)