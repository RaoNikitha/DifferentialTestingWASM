;; 3. **Nested Block with Unreachable within Exported Function:**    - Define an exported function containing nested blocks and insert an `unreachable` within a deeper block. Call this function from another module and ensure trapping at the correct point.    - **Constraint:** Check correct trap propagation and ensure the `unreachable` instruction within nested blocks correctly interrupts and exits from nested context back to the caller.

(assert_invalid
  (module
    (func $nested-block-unreachable
      (block
        (block
          (unreachable)
        )
      )
    )
  )
  "unreachable"
)