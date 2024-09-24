;; 3. **Interaction with Multiple `br_if`s**:    Include multiple `nop` instructions between `br_if` instructions with varying conditions. Verify that each `br_if` correctly evaluates the condition post-`nop` and takes the correct branching path.

 ;; (module
  (func (param i32) (result i32)
    (block $exit
      (block $inner
        (br_if $inner (i32.eq (local.get 0) (i32.const 1)))
        nop
        (br_if $inner (i32.eq (local.get 0) (i32.const 2)))
        nop
        (br_if $exit (i32.eq (local.get 0) (i32.const 3)))
        i32.const 0 ;; default case
        (return)
      )
      i32.const 1 ;; if none of the br_ifs triggered
    )
  )
)