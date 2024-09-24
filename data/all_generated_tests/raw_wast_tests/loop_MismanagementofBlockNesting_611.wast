;; 2. **Incorrect Block Type in Nested Loop**: Construct a loop with an incorrectly specified `blocktype` nested inside another loop. Observe how the implementation validates the nested loop’s `blocktype` against the specified constraints in the extended context. The differential error handling can reveal discrepancies in block type validation.

(assert_invalid
  (module (func
    (loop (result i32)
      (loop (param f32) (i32.const 0) (drop))
    )
  ))
  "type mismatch"
)