;; 4. **Test Description 4:** Implement a `br_if` instruction with a complex condition that depends on multiple stack values (e.g., `(x != 0) && (y > 5)`). Incorrect evaluation of the compound condition can lead to unexpected branching.    - **Constraint Checked:** Multi-part condition evaluation accuracy.    - **Differential Behavior:** Wizard Engine may simplify condition to always true or false, malfunctioning.

(assert_invalid
  (module
    (func $complex-conditional-branch-unwinding (result i32)
      (local i32)
      (local.set 0 (i32.const 3))
      (block (result i32)
        (block
          (local.get 0)
          (i32.const 5)
          (i32.gt_s)
          (local.get 0)
          (i32.const 1)
          (i32.and)
          (br_if 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)