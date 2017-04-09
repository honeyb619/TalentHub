using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using DataModel.GenericRepository;
using System.Data.Entity.Validation;

namespace DataModel.UnitOfWork
{
    /// <summary>
    /// Unit of Work class responsible for DB transactions
    /// </summary>
    public class UnitOfWork : IDisposable
    {
        #region Private member variables...

        private TalentSearchEntities _context = null;
        private GenericRepository<User> _userRepository;
        private GenericRepository<ProductionCompany> _productionCompanyRepository;
        private GenericRepository<Token> _tokenRepository;
        private GenericRepository<Talent> _talentRepository;
        private GenericRepository<Region> _regionRepository;
        private GenericRepository<SubCategory> _subCategoryRepository;
        private GenericRepository<Category> _categoryRepository;
        private GenericRepository<JobTalentCategory> _jobTalentCategoryRepository;
        private GenericRepository<JobTalentSkill> _jobTalentSkillRepository;
        private GenericRepository<Medium> _mediaRepository;
        private GenericRepository<usp_GetPublicTalent_Result> _usp_GetPublicTalent_ResultRepository;
        private GenericRepository<Job> _jobRepository;
        private GenericRepository<JobTalentLanguage> _jobTalentLanguageRepository;
        private GenericRepository<string> _usp_Delete_ResultRepository;

        #endregion

        public UnitOfWork()
        {
            _context = new TalentSearchEntities();
        }

        #region Public Repository Creation properties...

        /// <summary>
        /// Get/Set Property for JobTalentSkill repository.
        /// </summary>
        public GenericRepository<JobTalentSkill> JobTalentSkillRepository
        {
            get
            {
                if (this._jobTalentSkillRepository == null)
                    this._jobTalentSkillRepository = new GenericRepository<JobTalentSkill>(_context);
                return _jobTalentSkillRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for usp_GetPublicTalent_Result repository.
        /// </summary>
        public GenericRepository<usp_GetPublicTalent_Result> Usp_GetPublicTalent_ResultRepository
        {
            get
            {
                if (this._usp_GetPublicTalent_ResultRepository == null)
                    this._usp_GetPublicTalent_ResultRepository = new GenericRepository<usp_GetPublicTalent_Result>(_context);
                return _usp_GetPublicTalent_ResultRepository;
            }
        }
        /// <summary>
        /// Get/Set Property for usp_GetPublicTalent_Result repository.
        /// </summary>
        public GenericRepository<Category> CategoryRepository
        {
            get
            {
                if (this._categoryRepository == null)
                    this._categoryRepository = new GenericRepository<Category>(_context);
                return _categoryRepository;
            }
        }
        /// <summary>
        /// Get/Set Property for JobTalentCategory repository.
        /// </summary>
        public GenericRepository<JobTalentCategory> JobTalentCategoryRepository
        {
            get
            {
                if (this._jobTalentCategoryRepository == null)
                    this._jobTalentCategoryRepository = new GenericRepository<JobTalentCategory>(_context);
                return _jobTalentCategoryRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for Media repository.
        /// </summary>
        public GenericRepository<Medium> MediaRepository
        {
            get
            {
                if (this._mediaRepository == null)
                    this._mediaRepository = new GenericRepository<Medium>(_context);
                return _mediaRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for product repository.
        /// </summary>
        public GenericRepository<ProductionCompany> ProductionCompanyRepository
        {
            get
            {
                if (this._productionCompanyRepository == null)
                    this._productionCompanyRepository = new GenericRepository<ProductionCompany>(_context);
                return _productionCompanyRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for user repository.
        /// </summary>
        public GenericRepository<User> UserRepository
        {
            get
            {
                if (this._userRepository == null)
                    this._userRepository = new GenericRepository<User>(_context);
                return _userRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for token repository.
        /// </summary>
        public GenericRepository<Token> TokenRepository
        {
            get
            {
                if (this._tokenRepository == null)
                    this._tokenRepository = new GenericRepository<Token>(_context);
                return _tokenRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for talent repository.
        /// </summary>
        public GenericRepository<Talent> TalentRepository
        {
            get
            {
                if (this._talentRepository == null)
                    this._talentRepository = new GenericRepository<Talent>(_context);
                return _talentRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for region repository.
        /// </summary>
        public GenericRepository<Region> RegionRepository
        {
            get
            {
                if (this._regionRepository == null)
                    this._regionRepository = new GenericRepository<Region>(_context);
                return _regionRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for subcategory repository.
        /// </summary>
        public GenericRepository<SubCategory> SubCategoryRepository
        {
            get
            {
                if (this._subCategoryRepository == null)
                    this._subCategoryRepository = new GenericRepository<SubCategory>(_context);
                return _subCategoryRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for job repository.
        /// </summary>
        public GenericRepository<Job> JobRepository
        {
            get
            {
                if (this._jobRepository == null)
                    this._jobRepository = new GenericRepository<Job>(_context);
                return _jobRepository;
            }
        }

        /// <summary>
        /// Delete using procedure.
        /// </summary>
        public GenericRepository<string> DeleteUsingProc
        {
            get
            {
                if (this._usp_Delete_ResultRepository == null)
                    this._usp_Delete_ResultRepository = new GenericRepository<string>(_context);
                return _usp_Delete_ResultRepository;
            }
        }

        /// <summary>
        /// JobTalentLanguage.
        /// </summary>
        public GenericRepository<JobTalentLanguage> JobTalentLanguageRepository
        {
            get
            {
                if (this._jobTalentLanguageRepository == null)
                    this._jobTalentLanguageRepository = new GenericRepository<JobTalentLanguage>(_context);
                return _jobTalentLanguageRepository;
            }
        }
        #endregion

        #region Public member methods...
        /// <summary>
        /// Save method.
        /// </summary>
        public void Save()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {

                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format(
                        "{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now,
                        eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                // System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw e;
            }

        }

        #endregion

        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    Debug.WriteLine("UnitOfWork is being disposed");
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}