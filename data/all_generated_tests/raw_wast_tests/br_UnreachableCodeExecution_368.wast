;; 9. **Test Description:** Create loops with `br` instructions targeting both the loop and different surrounding blocks. Insert `unreachable` instructions in each path to catch incorrect forward and backward branch behavior.     - **Constraint Checked:** Differentiation between forward and backward branching.     - **Relation to Unreachable Code Execution:** Ensures branches do not erroneously reach `unreachable`.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner
          (loop $loop
            (br 1) ; This should jump to the end of $inner block
            (unreachable)
          )
          (br 0) ; This should jump to the end of $outer block
          (unreachable)
        )
        (br 0) ; Breaking outer block, should resume after block
        (unreachable)
      )
    )
  )
  "unreachable"
)