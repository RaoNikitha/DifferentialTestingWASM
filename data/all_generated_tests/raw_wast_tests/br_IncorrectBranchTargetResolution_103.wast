;; 4. **Test Forward Jump in Deep Nesting:**    - Define nested control structures and use `br` to jump to the end of the next enclosing block. Verify if the instruction properly resolves the label and continues execution after that block.

(assert_invalid
  (module
    (func $deep-nesting
      (block 
        (block
          (block
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)