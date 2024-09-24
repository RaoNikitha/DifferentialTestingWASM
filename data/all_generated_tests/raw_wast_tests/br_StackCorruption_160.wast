;; 1. **Test Description:**    Use a `br` instruction within a deeply nested set of `block` elements, ensuring the target label is several layers outward.     **Constraint Checked:** Correct unwinding of the operand stack to the appropriate height.    **Relation to Stack Corruption:** Incorrect unwinding could lead to underflow if too many operands are removed, or overflow if not enough are removed.

(assert_invalid
  (module
    (func $deeply_nested_br
      (block  ;; Label 0
        (block  ;; Label 1
          (block  ;; Label 2
            (block  ;; Label 3
              (block  ;; Label 4
                (br 5)  ;; Breaking out to Label 0 which should valid
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)