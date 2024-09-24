;; 2. **Test Description:**    - Sequence of nested `if` instructions, with a `br` instruction targeting a non-existent inner `if` label. Check if `unreachable` is executed due to incorrect label look-up.    - **Constraint: Relative Label Lookup**    - **Differential Behavior: The Wizard Engine should perform accurate label bounds-checking, whereas WebAssembly may misinterpret the depth and lead to `unreachable` execution.**

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (if (i32.const 1)
          (br 2) 
        )
      )
      (unreachable)
    )
  )
  "unknown label"
)