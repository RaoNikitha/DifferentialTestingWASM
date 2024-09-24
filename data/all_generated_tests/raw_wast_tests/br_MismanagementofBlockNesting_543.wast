;; 4. **Branching from Within a Loop to an Outer Block:**    Design a test where a `br` instruction inside a nested loop setup should target a block outside the loop. Check if the implementation handles the jump correctly out of the loop context, maintaining the control flow correctly.

(assert_invalid
  (module 
    (func (block
      (loop
        (br 1)
      )
    ))
  )
  "unknown label"
)