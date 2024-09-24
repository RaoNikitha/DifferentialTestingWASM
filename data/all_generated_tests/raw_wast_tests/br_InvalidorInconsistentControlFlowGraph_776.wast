;; 7. **Incorrect Sequential Branch Instructions:**    - Create a function with consecutive `br` instructions where the first `br` instruction invalidly targets a label already unwound by the second `br`.    - Reasoning: Tests correct sequential management of branches and unwound operand stacks.    - Relation to CFG: Incorrect management of consecutive branches can cause over-written paths in the CFG, compromising execution flow.

(assert_invalid
  (module
    (func $sequential-branch 
      (block $label1
        (block $label2
          (br 1) 
          (br 0)
        )
      )
    )
  )
  "unknown label"
)