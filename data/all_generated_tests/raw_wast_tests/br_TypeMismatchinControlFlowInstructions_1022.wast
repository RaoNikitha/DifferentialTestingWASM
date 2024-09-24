;; 3. **Test Description:**    - Construct a `block` with multiple nested `if` structures that result in different type expectations on branching with `br`, having some branches provide incorrect types.    - **Constraint Check:** It checks that all branches via `br` have operand stacks that match the expected types when joining back after the `if` branches.    - **Differential Behavior:** WebAssembly likely enforces strict type checking and throws appropriate errors, whereas Wizard Engine might fail to identify mismatches due to imperfect tracing and bounds checking.

(assert_invalid
  (module
    (func $nested-if-blocks
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (block
            (i32.const 1)
            (br 0)
          )
          (then
            (i32.const 2)
            (br 0)
          )
          (else
            (i32.const 3)
            (br 0)
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)