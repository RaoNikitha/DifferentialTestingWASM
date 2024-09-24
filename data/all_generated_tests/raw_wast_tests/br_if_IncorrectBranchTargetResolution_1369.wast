;; Test 10: - Test by deliberately creating a label collision scenario with multiple `br_if` instructions targeting the same label number but in differently structured nests (loop and block combinations). Validate the precise jump resolution. - **Constraint Checked**: Stack Polymorphism and Consistent Label Handling. - **Relation to Incorrect Branch Target Resolution**: Tests the ability to handle label collisions accurately, ensuring different nests’ contexts are respected.

(assert_invalid
  (module 
    (func $label-collision 
      (block
        (loop
          (block
            (br_if 0 (i32.const 1)) 
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "label collision"
)