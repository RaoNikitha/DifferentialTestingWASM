;; 4. **Test 4: Nested Blocks with Unreachable and Type Conflicts**    - A nested `block` with an inner `block` containing an `unreachable`, leading to type expectations that conflict with the outer block’s signatures. This probes how nested contexts manage the type effects of traps.    - **Constraint Checked:** Observes type merging and expectation between nested control flow instructions containing `unreachable`.

(assert_invalid
  (module (func $nested-blocks-with-unreachable-type-conflict
    (block (result i32)
      (block (result i32)
        (unreachable)
      )
    )
  ))
  "type mismatch"
)