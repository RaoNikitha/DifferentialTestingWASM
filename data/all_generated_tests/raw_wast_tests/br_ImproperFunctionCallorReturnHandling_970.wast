;; 1. **Direct Function Call with Nested Blocks:**    - Test a direct function call (`call`) nested within multiple `block` and `loop` instructions, followed by an unconditional branch (`br`) targeting one of the nested blocks to ensure the branch skips the function call correctly and all stack interactions remain intact.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (call 0)
            (br 1)
          )
        )
      )
    )
  )
  "unknown function 0"
)