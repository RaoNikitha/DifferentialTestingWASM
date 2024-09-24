;; 9. **Multiple Branch Instructions:**    - Test a single block containing multiple `br` instructions, each targeting different labels at varying nesting levels.    - Evaluates the CFG's ability to correctly sequence multiple branches and maintain proper control flow among diverse targets.

(assert_invalid
  (module
    (func
      (block $label1
        (block $label2
          (br $label1)
          (br $label2)
        )
      )
    )
  )
  "unknown label"
)