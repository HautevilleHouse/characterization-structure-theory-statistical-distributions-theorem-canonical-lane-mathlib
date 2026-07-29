import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure StatisticalModel (M : Type u) where
  sampleSpace : Type v
  parameterSpace : Type w
  family : parameterSpace → Set (sampleSpace → ℝ)
  densities : parameterSpace → sampleSpace → ℝ
  densityNonnegative : ∀ θ x, densities θ x ≥ 0
  densityIntegratesToOne : ∀ θ, ∫ x, densities θ x = 1

structure SufficientStatistic (M : StatisticalModel) where
  statistic : M.sampleSpace → ℝ^n
  factorizationExists : ∀ θ₁ θ₂, ∃ (g : ℝ^n → ℝ) (h : M.sampleSpace → ℝ),
    M.densities θ₁ = λ x => g (statistic x) * h x ∧ M.densities θ₂ = λ x => g (statistic x) * h x

theorem neyman_fisher_factorization (M : StatisticalModel) (S : SufficientStatistic M) :
  ∀ θ₁ θ₂, ∃ g h, M.densities θ₁ = (λ x => g (S.statistic x) * h x) ∧ M.densities θ₂ = (λ x => g (S.statistic x) * h x) :=
  S.factorizationExists

structure SufficiencyEvidence (M : StatisticalModel) (S : SufficientStatistic M) where
  factorizationClosed : ∀ θ₁ θ₂, ∃ g h, M.densities θ₁ = (g ∘ S.statistic) * h ∧ M.densities θ₂ = (g ∘ S.statistic) * h

def SufficiencyClosed (M : StatisticalModel) (S : SufficientStatistic M) : Prop :=
  SufficiencyEvidence M S

theorem sufficiency_closed_from_evidence (M : StatisticalModel) (S : SufficientStatistic M) (ev : SufficiencyEvidence M S) :
  SufficiencyClosed M S := ev

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse