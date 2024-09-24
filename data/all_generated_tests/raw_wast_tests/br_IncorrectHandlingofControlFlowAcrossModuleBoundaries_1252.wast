;; 3. **Test Description:**    Design a module with a `block` that contains a call to an imported function. Inside the imported function, include a `br` instruction targeting the block in the calling module. Ensure the branch correctly exits the block and resumes execution in the caller module.

(assert_invalid
  (module
    (import "mod" "func" (func $external))
    (func $caller
      (block $lbl
        call $external
        br $lbl
      )
    )
  )
  "invalid branch from imported function"
)