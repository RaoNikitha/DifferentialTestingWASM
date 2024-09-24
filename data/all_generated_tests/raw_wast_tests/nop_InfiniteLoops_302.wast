;; 3. **Infinite Loop Prevention in Loop with Nop and br_if**:    - Design a loop that uses a `br_if` instruction dependent on a condition, with several `nop` instructions inside the loop. The test will check if `resetSig` initializes the context such that `br_if` exits the loop correctly.    - Constraint: The loop should exit when the condition for `br_if` is met; `nop` should not prevent this.

 ;; (module
  (func (block $exit
    (loop $infinite
      (nop)
      (nop)
      (br_if $exit (i32.const 1))
      (br $infinite)
    )
  ))
)