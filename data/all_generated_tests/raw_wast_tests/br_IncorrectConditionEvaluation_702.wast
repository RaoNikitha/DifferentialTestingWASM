;; 3. **Test Description 3:** Create a nested structure with an outer block, an inner loop, and a `br_if` instruction inside the loop that checks if a counter is even (`i % 2 == 0`). An incorrect evaluation may always lead to a loop exit, invalidating even iterations.    - **Constraint Checked:** Conditional branches checking parity.    - **Differential Behavior:** Wizard Engine may exit the loop on every iteration instead of every other iteration.

(assert_invalid
  (module
    (func $conditional-parity-branch
      (block $outer
        (loop $inner
          (local i32)
          (local.set 0 (i32.const 10)) 
          (br_if $outer (i32.eqz (i32.rem_s (local.get 0) (i32.const 2))))
          ;; Counting down to make the loop terminate
          (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
          (br $inner)
        )
      )
    )
  )
  "conditional branch parity check"
)