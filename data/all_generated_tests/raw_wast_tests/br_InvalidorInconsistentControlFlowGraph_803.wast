;; 4. **Invalid Backward Branch in Nested Loop Test:**    Set up nested loops with `br` instructions that attempt to branch backward to the wrong loop depth. This ensures the engine detects invalid backward branches and handles them without breaking the structured control flow.

(assert_invalid
  (module
    (func
      (block
        (loop (br 1))
        (loop (br 2))
      )
    )
  )
  "unknown label"
)