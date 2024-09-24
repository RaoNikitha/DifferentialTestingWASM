;; 10. **Invalid Context Extension Returning Unreachable for Outer Block**:    - Form a `block` nested within another block. Incorrect context extension in the nesting might cause a branch in the outer block to improperly jump into an inner `block` with `unreachable`. This checks if outer scopes are insulated correctly from inner context errors.

(assert_invalid
  (module
    (func $nested-block-invalid-context (result i32)
      (block (result i32)
        (block (result f32)
          (br 1 (unreachable))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)