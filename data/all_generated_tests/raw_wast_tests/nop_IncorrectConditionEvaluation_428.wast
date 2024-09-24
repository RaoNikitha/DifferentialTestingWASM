;; Insert `nop` instructions before a `br_if` inside a function call. Ensure that the branching within the called function depends correctly on the passed argument conditions.

(assert_invalid
  (module
    (func (param i32)
      nop
      br_if 0 (local.get 0)
    )
  )
  "branch to invalid label"
)