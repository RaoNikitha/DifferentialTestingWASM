;; 3. **Test Description: Invalid Forward Branch Target in Outer Block**    - **Reasoning**: The `br_if` instruction targets a `block` instruction in a more outer scope.    - **Constraint Checked**: Validating the forward jump to an enclosing `block` structure.    - **Inconsistent CFG**: The CFG may misinterpret nested structure, skipping necessary checks.    - **Expected Differential Behavior**: WASM raises a generic error, and wizard_engine signals an `OobLabel` error upon invalid forward target reference.

(assert_invalid
  (module
    (func $invalid-forward-branch-target-in-outer-block
      (block
        (block
          (br_if 1 (i32.const 1)) 
        )
      )
    )
  )
  "type mismatch"
)