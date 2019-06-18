(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit HomeModelFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model THomeModel
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    THomeModelFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    HomeModel;

    function THomeModelFactory.build(const container : IDependencyContainer) : IDependency;
    var db : IRdbms;
    begin
        {---initialize database here---}
        { db := container.get('db') as IRdbms;}
        result := THomeModel.create(db);
    end;
end.