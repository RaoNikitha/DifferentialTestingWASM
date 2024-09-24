;; 8. **Test Description:**    Nested `block` and `if` constructs containing early `unreachable` instructions followed by mixed `br_if` and `br_table` instructions with complex jumping conditions.    - **Constraint Checked:** Ensures that the conditions determining jumps are not evaluated past the initial `unreachable`, and traps are consistently handled.    - **Relation to Mismanagement of Block Nesting:** Tests for mishandling in control flow due to early traps within mixed, deeply nested structures.

(assert_invalid
  (module (func $nested-block-if-unreachable
    (block (if (i32.const 1)
      (then (block (unreachable)))
      (else (block (block (unreachable) (i32.const 0)) (br 1)))
    ) (br_if 0 (i32.const 1)) (br_table 0 1 (i32.const 3)))
  ))
  "type mismatch"
)