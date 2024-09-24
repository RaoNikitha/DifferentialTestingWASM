;; 5. **Branch Forward to Unreachable**:    - Embed a branch pointing to an instruction label just before `unreachable` inside the block.    - Tests accurate error handling and proper branch target identification.    - Misrouting branches may erroneously navigate to the `unreachable`.

(assert_invalid
  (module
    (func
      (block (br 1) (unreachable))
    )
  )
  "unknown label"
)