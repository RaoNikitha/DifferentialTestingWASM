;; 10. Structure a scenario with multiple nested `loops` and `blocks` where `br` targets a label in a sibling scope of a nested `block`. This ensures the implementation can correctly identify and jump to equivalent level structures for **sibling scope resolution**.

(assert_invalid
  (module
    (func $sibling-scope-label
      (block
        (block
          (loop
            (block (br 2))
          )
        )
      )
    )
  )
  "unknown label"
)