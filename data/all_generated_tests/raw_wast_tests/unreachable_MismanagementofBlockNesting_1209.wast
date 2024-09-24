;; 10. **Test Description:**    Complex nested loops each containing internal blocks with conditions involving `br`, `unreachable`, and `br_table` instructions, implicitly testing combined exit scenarios.    - **Constraint Checked:** Ensures that combined scenarios, where `unreachable` and `br` instructions co-exist, maintain proper execution integrity across nested levels.    - **Relation to Mismanagement of Block Nesting:** Tests composite management of nested structures ensuring coherent implementations respect innermost-to-outermost control flow leading to the correct trap-induced state.

(assert_invalid
  (module (func $complex-nested-loops
    (loop $L1
      (block $B1
        (br_if $L1 (i32.const 0))
        (block $B2
          (br $B1)
          (unreachable)
          (br_table $L1 $B2 $L1 (i32.const 0))
          (i32.const 1)
        )
      )
    )
  ))
  "type mismatch"
)