;; 8. **Branch in Deeply Nested Structures**    - Create a deeply nested structure of loops and blocks with a `br` instruction attempting to resolve a higher-level loop. This ensures proper hierarchical label resolution.

(assert_invalid 
  (module 
    (func $nested_loops 
      (loop $outer (result i32) 
        (loop $inner 
          (br $outer)
        )
      )
    ) 
  ) 
  "type mismatch"
)