;; 4. **Invalid Unstructured Jump Test**: Create a configuration that attempts to perform a `br` to a label not within a well-nested structured control instruction, like jumping into an arbitrary position within a `block` or `if`. This tests whether the implementation correctly enforces structured control flow and prohibits unstructured jumps.

(assert_invalid
  (module
    (func $invalid-unstructured-jump
      (block
        (br 1)
        (i32.const 0)
      )
      (i32.eqz) (drop)
    )
  )
  "jump to missing label"
)