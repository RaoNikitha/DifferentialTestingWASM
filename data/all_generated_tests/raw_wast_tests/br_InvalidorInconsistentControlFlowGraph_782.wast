;; 3. **Test Description:**    - Use an `if` control construct containing a nested `block` and a `br` instruction targeting the `block`.    - **Constraint:** Ensure that execution resumes after the `block`’s end when the branch is taken.    - **CFG Check:** Verifies the proper handling of forward branches and avoids CFG misinterpretation of block boundaries.

(assert_invalid
  (module
    (func $test-forward-branch-after-block-end
      (if (i32.const 1)
        (then
          (block
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)