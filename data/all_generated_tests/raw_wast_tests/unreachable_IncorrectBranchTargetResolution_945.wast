;; 6. Set up a nested structure with multiple labels where an `unreachable` is placed before several `br` instructions targeting different labels. Confirm no branches are resolved or executed due to the unconditional trap.

(assert_invalid
  (module (func $type-block-nested-multi-label-unreachable
    (block $label1
      (block $label2
        (block $label3
          unreachable
          br $label1
          br $label2
          br $label3
        )
      )
    )
  ))
  "type mismatch"
)