;; 8. **Test 8: Cross Function Branch Targeting**    - Description: Design a test where a loop's `br` instruction attempts to branch to a label defined in another function. This is invalid but should test if the engine correctly restricts branch targets to the current function scope.    - Constraint: Checks function scope boundary constraints for label resolution.

(assert_invalid
  (module
    (func $function1
      (loop $loop1 (br 1))
    )
    (func $function2
      (loop $loop2)
    )
  )
  "unknown label"
)