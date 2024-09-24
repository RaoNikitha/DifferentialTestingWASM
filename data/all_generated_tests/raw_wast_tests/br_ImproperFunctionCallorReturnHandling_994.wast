;; 5. **Test Description:** A nested set of blocks within a function where the innermost block contains a direct `call` to another function that contains `br` targeting its own outer block.    **Constraint Checked:** Ensuring `br` in a called function respects its own scoping.    **Relation to Function Call/Return Handling:** Validates return paths post `br` and direct function calls to ensure structured exits.

(assert_invalid
  (module
    (func $test
      (block (block (call $func_with_br)))
    )
    (func $func_with_br
      (block (br 1))
    )
  )
  "unknown label"
)